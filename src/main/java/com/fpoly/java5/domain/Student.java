package com.fpoly.java5.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    @NotBlank(message ="{NotBlank.student.name}")
    private String name;
    @NotBlank(message = "{NotBlank.student.email}")
    @Email(message = "{Email.student.email}")
    private String email;
    @NotNull(message = "{NotNull.student.mark}")
    @Min(value = 0, message = "{Min.student.mark}")
    @Max(value = 10, message = "{Mark.student.mark}")
    private Double mark;
    @NotNull(message = "{NotNull.student.gender}")
    private Boolean gender;
    @NotBlank(message = "{NotBlank.student.faculty}")
    private String faculty;
    @NotEmpty(message = "{NotEmpty.student.hobbies}")
    private List<String> hobbies;
    private String img;
//    @NotBlank(message = "Vui lòng nhập họ và tên")
//    private String name;
//    @NotBlank(message = "Vui lòng nhập email")
//    @Email(message = "Email nhập không đúng định dạng")
//    private String email;
//    @NotNull(message = "Vui lòng nhập điểm")
//    @Min(value = 0, message = "Vui lòng nhập điểm > 0")
//    @Max(value = 10, message = "Vui lòng nhập điểm < 10")
//    private Double mark;
//    @NotNull(message = "Vui lòng chọn giới tính")
//    private Boolean gender;
//    @NotBlank(message = "Vui lòng chọn khoa")
//    private String faculty;
//    @NotEmpty(message = "Vui lòng chọn sở thích")
//    private List<String> hobbies;
}
