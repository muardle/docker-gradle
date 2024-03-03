FROM eclipse-temurin:21-jdk-alpine

ENV GRADLE_VERSION="8.6"

ENV GRADLE_SHA256="9631d53cf3e74bfa726893aee1f8994fee4e060c401335946dba2156f440f24c"

RUN wget --no-verbose https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
  echo "${GRADLE_SHA256} gradle-${GRADLE_VERSION}-bin.zip" | sha256sum -c && \
  unzip gradle-${GRADLE_VERSION}-bin.zip && \
  rm gradle-${GRADLE_VERSION}-bin.zip && \
  mv gradle-${GRADLE_VERSION} /opt/gradle

ENV PATH="$PATH:/opt/gradle/bin"

WORKDIR /etc/gradle

ENTRYPOINT ["gradle"]
