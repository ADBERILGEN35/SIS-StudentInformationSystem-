package com.ube.sis.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LessonCreateRequest {
  private String lessonName;
  private Long instructorId;
  private int year;
  private String semester;
}
