FROM eclipse-temurin:21-jdk-alpine

ENV GRADLE_VERSION="8.7"

ENV GRADLE_SHA256="544c35d6bd849ae8a5ed0bcea39ba677dc40f49df7d1835561582da2009b961d"

RUN wget --no-verbose https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
  echo "${GRADLE_SHA256} gradle-${GRADLE_VERSION}-bin.zip" | sha256sum -c && \
  unzip gradle-${GRADLE_VERSION}-bin.zip && \
  rm gradle-${GRADLE_VERSION}-bin.zip && \
  mv gradle-${GRADLE_VERSION} /opt/gradle

ENV PATH="$PATH:/opt/gradle/bin"

WORKDIR /etc/gradle

ENTRYPOINT ["gradle"]
