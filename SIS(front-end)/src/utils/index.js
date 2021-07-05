const TOKEN_KEY = 'jwt';

export const login = (tokenKey) => {
    localStorage.setItem(TOKEN_KEY, tokenKey);
}

export const logout = () => {
    localStorage.removeItem(TOKEN_KEY);
}

export const isLogin = () => {
    return !!localStorage.getItem(TOKEN_KEY);


}