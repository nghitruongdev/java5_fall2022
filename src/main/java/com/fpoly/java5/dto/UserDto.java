package com.fpoly.java5.dto;


import com.fpoly.java5.validate.PasswordMatches;
import com.fpoly.java5.validate.ValidEmail;
import com.sun.istack.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;

@PasswordMatches
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
    @NotNull
    @NotEmpty
    String fullname;

    @NotNull
    @NotEmpty
    String password;

    @NotNull
    @NotEmpty
    String matchingPassword;

    @NotNull
    @NotEmpty
    @ValidEmail

    String email;
}
