package com.practice.util;

import org.mindrot.jbcrypt.BCrypt;

public final class EncryptUtil {

    /**
     * 비밀번호 문자열을 해시값으로 암호화해주는 메소드
     *
     * @param password - 비밀번호 문자열
     * @return String - 암호화된 비밀번호
     */
    public static final String encrypt(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    /**
     * 입력받은 비밀번호와 해시값을 같은 값인지 확인하는 메소드
     *
     * @param password - 비밀번호 문자열
     * @param hashed - 비교할 비밀번호의 해시값
     * @return boolean - 결과값
     */
    public static final boolean isMatch(String password, String hashed) {
        return BCrypt.checkpw(password, hashed);
    }
}
