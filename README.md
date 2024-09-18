# ts-monorepo-init

## commit template 설정

```
git config --local commit.template ./.github/.gitmessage.txt
```

## Yarn 설정

```
$npm install -g corepack
$corepack prepare yarn@stable --activate
$yarn set version stable
$yarn
$yarn dlx @yarnpkg/sdks vscode
```

## 스크립트

```
yarn workspace @apps/${이름} ${스크립트}

<!-- 개발모드 -->
yarn dev-api

<!-- 빌드 -->
yarn build-api

<!-- 빌드 실행 -->
yarn start-api

<!-- libs 빌드 -->
yarn build-libs
```
