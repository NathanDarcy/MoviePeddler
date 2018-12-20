package edu.umsl.cs5012.groupproject.form;

import javax.validation.constraints.NotBlank;

public class UserLoginForm {
    @NotBlank
    private String loginid;
    @NotBlank
    private String password;

    public void setLoginid(String loginid) {
        this.loginid = loginid;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLoginid() {
        return loginid;
    }

    public String getPassword() {
        return password;
    }
}
