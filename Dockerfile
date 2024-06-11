FROM eclipse-temurin:21-jdk-alpine

ENV GRADLE_VERSION="8.8"

ENV GRADLE_SHA256="a4b4158601f8636cdeeab09bd76afb640030bb5b144aafe261a5e8af027dc612"

RUN wget --no-verbose https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
  echo "${GRADLE_SHA256} gradle-${GRADLE_VERSION}-bin.zip" | sha256sum -c && \
  unzip gradle-${GRADLE_VERSION}-bin.zip && \
  rm gradle-${GRADLE_VERSION}-bin.zip && \
  mv gradle-${GRADLE_VERSION} /opt/gradle

ENV PATH="$PATH:/opt/gradle/bin"

WORKDIR /etc/gradle

ENTRYPOINT ["gradle"]
