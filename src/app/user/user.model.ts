/**
 * 查询用户信息参数
 */
export interface GetUserOpts {
  uid: number
}

/**
 * 用户信息
 */
export interface UserInfo {
  uid: number
  user_name: string
  phone: string
  email?: string
}
