package com.codingdojo.overflow.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.overflow.models.Answer;
import com.codingdojo.overflow.models.Question;
import com.codingdojo.overflow.models.Tag;
import com.codingdojo.overflow.models.TagQuestion;
import com.codingdojo.overflow.repository.AnswerRepository;
import com.codingdojo.overflow.repository.QuestionRepository;
import com.codingdojo.overflow.repository.TagQuestionRepository;
import com.codingdojo.overflow.repository.TagRepository;

@Service
public class OverflowService {
	private final AnswerRepository answerRepository;
	private final QuestionRepository questionRepository;
	private final TagRepository tagRepository;
	private final TagQuestionRepository tagQuestionRepository;
	
	public OverflowService(AnswerRepository answerRepository, QuestionRepository questionRepository, 
							TagRepository tagRepository, TagQuestionRepository tagQuestionRepository) {
		this.answerRepository = answerRepository;
		this.questionRepository = questionRepository;
		this.tagRepository = tagRepository;
		this.tagQuestionRepository = tagQuestionRepository;
	}
	
	public Answer saveAnswer(Answer answer) {
		return answerRepository.save(answer);
	}
	
	public Question saveQuestion(Question question) {
		return questionRepository.save(question);
	}
	
	public Tag saveTag(Tag tag) {
		return tagRepository.save(tag);
	}
	
	public TagQuestion saveTagQuestion(TagQuestion tagQuestion) {
		return tagQuestionRepository.save(tagQuestion);
	}
	
	public Tag findSpecificTagbyName(String name) {
		return tagRepository.findBySubjectIgnoreCase(name);
	}
	
	public List<Question> allQuestions(){
		return questionRepository.findAll();
	}
	
	public Question findQuestionById(Long id) {
		Optional<Question> check = questionRepository.findById(id);
		if(check.isPresent()) {
			return check.get();
		}
		else {
			return null;
		}
	}
	
	public void tagCheckAndSave(List<String> tags, Question question) {
		Question saveQuestion = saveQuestion(question);
		for(String check : tags) {
			if(findSpecificTagbyName(check) != null) {
				TagQuestion combine = new TagQuestion();
				combine.setTag(findSpecificTagbyName(check));
				combine.setQuestion(saveQuestion);
				saveTagQuestion(combine);
			}
			else {
				Tag newTag = new Tag();
				newTag.setSubject(check);
				Tag Tag2 = saveTag(newTag);
				TagQuestion combine = new TagQuestion();
				combine.setTag(Tag2);
				combine.setQuestion(saveQuestion);
				saveTagQuestion(combine);
			}
		}
	}
	
	
}