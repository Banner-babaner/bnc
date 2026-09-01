FROM eclipse-temurin:26-jdk-jammy AS build

WORKDIR /build

COPY --chmod=0755 mvnw mvnw
COPY .mvn/ .mvn/

COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 \
    ./mvnw dependency:go-offline -DskipTests

COPY src/ src/

RUN --mount=type=cache,target=/root/.m2 \
    ./mvnw clean package -DskipTests

FROM eclipse-temurin:26-jre-jammy

WORKDIR /app

RUN adduser --disabled-password --gecos "" --home "/nonexistent" \
    --shell "/sbin/nologin" --no-create-home --uid 10001 appuser

COPY --from=build /build/target/*.jar /app/app.jar

COPY --from=build /build/src/main/resources /app/resources

RUN ls -la /app/resources/db/changelog/ || echo "No resources directory"

RUN chown -R appuser:appuser /app

USER appuser

ENTRYPOINT ["java", "-jar", "/app/app.jar"]