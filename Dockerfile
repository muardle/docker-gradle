FROM eclipse-temurin:21-jdk-alpine

ENV GRADLE_VERSION="8.5"

ENV GRADLE_SHA256="9d926787066a081739e8200858338b4a69e837c3a821a33aca9db09dd4a41026"

RUN wget --no-verbose https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
  echo "${GRADLE_SHA256} gradle-${GRADLE_VERSION}-bin.zip" | sha256sum -c && \
  unzip gradle-${GRADLE_VERSION}-bin.zip && \
  rm gradle-${GRADLE_VERSION}-bin.zip && \
  mv gradle-${GRADLE_VERSION} /opt/gradle

ENV PATH="$PATH:/opt/gradle/bin"

WORKDIR /etc/gradle

ENTRYPOINT ["gradle"]
