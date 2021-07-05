package com.ube.sis.service;

import com.ube.sis.entity.Instructor;
import com.ube.sis.entity.Lesson;
import com.ube.sis.entity.Student;
import com.ube.sis.entity.StudentLesson;
import com.ube.sis.entity.StudentLessonKey;
import com.ube.sis.exception.NoSuchLessonException;
import com.ube.sis.exception.NoSuchUserException;
import com.ube.sis.model.ESemester;
import com.ube.sis.model.request.LessonCreateRequest;
import com.ube.sis.repository.InstructorRepository;
import com.ube.sis.repository.LessonRepository;
import com.ube.sis.repository.StudentLessonRepository;
import com.ube.sis.repository.StudentRepository;
import java.time.LocalDate;
import org.springframework.stereotype.Service;

@Service
public class  AdminService {

  private final LessonRepository lessonRepository;
  private final InstructorRepository instructorRepository;
  private final StudentLessonRepository studentLessonRepository;
  private final StudentRepository studentRepository;

  public AdminService(LessonRepository lessonRepository, InstructorRepository instructorRepository, StudentLessonRepository studentLessonRepository, StudentRepository studentRepository) {
    this.lessonRepository = lessonRepository;
    this.instructorRepository = instructorRepository;
    this.studentLessonRepository = studentLessonRepository;
    this.studentRepository = studentRepository;
  }

  public void createLesson(LessonCreateRequest lessonCreateRequest) throws NoSuchUserException {
    Instructor inst = instructorRepository.findById(lessonCreateRequest.getInstructorId()).orElseThrow(() -> new NoSuchUserException("No such instructor"));
    lessonRepository.save(new Lesson(0L,
        lessonCreateRequest.getLessonName(),
        inst,
        LocalDate.of(lessonCreateRequest.getYear(), 1, 1),
        ESemester.valueOf(lessonCreateRequest.getSemester())));
  }

  public void addStudentToLesson(Long studentId, Long lessonId) {
    studentLessonRepository.save(new StudentLesson(new StudentLessonKey(studentId, lessonId), 0.0));
  }

  public void deleteLesson(Long lessonId) {
    studentLessonRepository.deleteByLessonId(lessonId);
  }

  public void updateLesson(Lesson req) throws NoSuchLessonException {
    Lesson lesson = lessonRepository.findById(req.getLessonId()).orElseThrow(() -> new NoSuchLessonException("no such lesson"));
    lesson.setLessonName(req.getLessonName());
    lesson.setInstructor(req.getInstructor());
    lesson.setSemester(req.getSemester());
    lesson.setYear(req.getYear());
    lessonRepository.save(lesson);
  }

  public void assignCounselor(Long studentId, Long instructorId) throws NoSuchUserException {
    Instructor inst = instructorRepository.findById(instructorId).orElseThrow(() -> new NoSuchUserException("No such instructor"));
    Student student = studentRepository.findById(studentId).orElseThrow(() -> new NoSuchUserException("No such user"));
    student.setCounselor(inst.getUser());
    studentRepository.save(student);
  }
}
