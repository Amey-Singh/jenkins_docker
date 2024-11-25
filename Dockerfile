FROM openjdk:latest

WORKDIR /app

# Copy the compiled HelloWorld.class file into the container
COPY HelloWorld.class /app/

# Run the HelloWorld.class file
CMD ["java", "HelloWorld"]
