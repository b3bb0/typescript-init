
# Typescript boiler room 🤣

the usual stuff:
- `npm run dev`
- `npm run build`

--------------------------------------------

**Step 1:**
init the TS project
```bash
npm i typescript --save-dev
npx tsc --init
mkdir src
```

--------------------------------------------


**Step 2:**
to tune up the compiler options
```bash
echo 'NODE_ENV=development' > .env.local
echo 'NODE_ENV=production' > .env.build
vi tsconfig.json
```

--------------------------------------------


**Step 3:**
install dev dependencies
```bash
npm install \
    @types/node \
    typescript \
    ts-node \
    eslint \
    typescript-eslint \
    globals \
  --save-dev
```

--------------------------------------------

**Docker**

the dockerfile is a simple example of how to run a typescript project in a container
build the image with:
- `docker build -t ts-boiler-room .`

run the container with:
- `docker run -it --rm ts-boiler-room`


> The Dockerfile is semi-production ready, meaning...
> it's gcompile e copy **only the build forlder.**
> So it's NOT RECCOMENDED for dev/testing

--------------------------------------------