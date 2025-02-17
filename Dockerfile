# Step 1: Define an ARG variable for build time
ARG NODE_VERSION=18-alpine

# Step 2: Use ARG to define the base image dynamically
FROM node:$NODE_VERSION

# Step 3: Define ENV variables
ENV APP_HOME=/usr/src/app
ENV APP_PORT=3000

# Step 4: Create the application directory
WORKDIR $APP_HOME

# Step 5: Define another ARG and use it inside RUN (but not available at runtime)
ARG PACKAGE_MANAGER=npm
RUN $PACKAGE_MANAGER install -g serve

# Step 6: Copy application files (if any)
COPY . .

# Step 7: Expose the port defined by ENV
EXPOSE $APP_PORT

# Step 8: Set the default command
CMD ["serve", "-s", "build", "-l", "$APP_PORT"]