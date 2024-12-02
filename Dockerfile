# 2단계: Spring Boot 앱 빌드
FROM openjdk:17-jdk-slim AS springboot-build

WORKDIR /app/springboot-app

COPY build/libs/RE_BOOK-0.0.1-SNAPSHOT.jar /app/RE_BOOK-app.jar

WORKDIR /app

# Spring Boot JAR 파일 복사
COPY --from=springboot-build /app/RE_BOOK-app.jar /app/RE_BOOK-app.jar

# 환경 변수 설정 zz
ENV JAVA_HOME=/usr/local/openjdk-17
ENV PATH=$JAVA_HOME/bin:$PATH

# Spring Boot 실행
CMD ["/usr/local/openjdk-17/bin/java", "-jar", "/app/RE_BOOK-app.jar"]
