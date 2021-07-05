import request from "./request"

function login(content) {
    return request({
        url: '/api/auth/signin',
        method: 'POST',
        data: content
    })
}

export const AuthService = {
    login
}
