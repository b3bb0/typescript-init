# Set the base image from Docker repository to build our app. In this case we want to use node image to run our node app
FROM node:20.14.0-bookworm as base

# Then, we need to copy our package.json and .env file into the image root folder.
COPY ./package.json ./

RUN npm install -g npm@10.8.1

RUN npm i

COPY ./src ./src
COPY ./tsconfig.json ./tsconfig.json

RUN npm run build

# After using base image for build process, we can create another
# image for the production build.

# Start production image build, we will use the same node image
FROM node:20.14.0-bookworm as wild-daemon

WORKDIR /app

# Copy node modules and build directory from base image to new image
COPY --from=base ./node_modules ./node_modules
COPY --from=base ./package.json ./package.json
COPY --from=base ./package-lock.json ./package-lock.json
COPY --from=base /dist ./dist

COPY .env.build ./.env

CMD [ "npm", "run", "start" ]