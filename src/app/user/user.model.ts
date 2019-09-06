/**
 * 查询用户信息参数
 */
export interface GetUserOpts {
  uid: number
}

/**
 * 库表类型
 */
export interface TbListModel {
  tb_user: User
  tb_user_detail: UserDetail
}

/**
 * 用户信息
 */
export interface UserInfo extends User, UserDetail {
}


export interface User {
  uid: number
  user_name: string
}
export interface UserDetail {
  uid: number
  phone: string
  email: string
}

