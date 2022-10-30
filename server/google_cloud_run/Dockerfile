FROM dart:stable

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart compile exe bin/server.dart -o bin/server

EXPOSE 8080
CMD ["/app/bin/server"]