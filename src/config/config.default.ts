import { readFileSync } from 'fs'

import { EggAppInfo } from 'midway'
import { join } from '@waiting/shared-core'

import { DefaultConfig } from './config.modal'


export default (appInfo: EggAppInfo) => {
  const config = <DefaultConfig> {}

  // use for cookie sign key, should change to your own and keep security
  config.keys = `${ appInfo.name }_1559532739675_8498`

  const buf = readFileSync(join(appInfo.baseDir, 'app/public/favicon.png'))
  config.siteFile = {
    '/favicon.ico': buf,
    '/favicon.png': buf,
  }

  // switch by plugin.ts:cors.enable
  config.cors = {
    origin: '*',
    // allowMethods: 'DELETE,GET,HEAD,OPTIONS,PATCH,POST,PUT',
    allowMethods: 'GET,HEAD,OPTIONS,POST',
    maxAge: 600,
  }

  // add your config here
  config.middleware = []

  config.welcomeMsg = 'Hello midwayjs!'

  return config
}
