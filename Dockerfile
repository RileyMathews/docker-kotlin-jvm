FROM rileymathews/base
RUN amazon-linux-extras install java-openjdk11 -y

# install kotlin compiler
RUN curl -LJo /tmp/kotlin.zip https://github.com/JetBrains/kotlin/releases/download/v1.3.70/kotlin-compiler-1.3.70.zip && \
    unzip /tmp/kotlin.zip -d /opt/kotlin && \
    rm -rf /tmp/kotlin.zip \
    && \
    # install gradle
    curl -LJo /tmp/gradle.zip https://services.gradle.org/distributions/gradle-6.1-bin.zip && \
    unzip /tmp/gradle.zip -d /opt/gradle && \
    rm -rf /tmp/gradle.zip

# set path for gradle and kotlinc
ENV PATH=$PATH:/opt/gradle/gradle-6.1/bin:/opt/kotlin/kotlinc/bin

# set java home
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.7.10-4.amzn2.0.1.x86_64

WORKDIR /code
CMD ["zsh"]
