import { provide, plugin } from 'midway'
import { DbModel } from 'egg-kmore'

import { GetUserOpts, UserInfo, TbListModel, User } from './user.model'


@provide()
export class UserService {

  constructor(
    @plugin('kmore') private readonly db: DbModel<TbListModel>,
  ) { }

  /**
   * 读取用户信息
   */
  public async getUser(options: GetUserOpts): Promise<UserInfo> {
    return {
      uid: options.uid,
      user_name: 'mockedName',
      phone: '12345678901',
      email: 'xxx.xxx@xxx.com',
    }
  }


  public async getUserName(options: GetUserOpts): Promise<User['user_name']> {
    const { rb } = this.db

    const name = await rb.tb_user()
      .select('user_name')
      .where('uid', options.uid)
      .then(rows => rows[0] ? rows[0].user_name : '')

    return name
  }

}
