# Midway demo


[![GitHub tag](https://img.shields.io/github/tag/waitingsong/midway-base.svg)]()
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![](https://img.shields.io/badge/lang-TypeScript-blue.svg)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)


## Initialization

```sh
npm run repo:init
npm run dev
```

Open url and refreseh page:
- http://localhost:7001/
- http://localhost:7001/ip
- http://localhost:7001/token
- http://localhost:7001/test_sign


## Deploy

```bash
npm run clean && npm run build
npm start
npm stop
```


## Test

- Use `npm run lint` to check code style.
- Use `npm run test` to run unit test.


## Note

- Run `npm run clean` before `npm run build`, if any file under typescript outDir folder was deleted manually.


## Document and Plugins

- [Midway]
- [egg-fetch]
- [egg-jwt]
- [egg-kmore]


[Midway]: https://midwayjs.org/midway
[egg-fetch]: https://github.com/waitingsong/egg-fetch
[egg-jwt]: https://github.com/waitingsong/egg-jwt
[egg-kmore]: https://github.com/waitingsong/egg-kmore
