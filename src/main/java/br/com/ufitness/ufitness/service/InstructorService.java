package br.com.ufitness.ufitness.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InstructorService {
    @Autowired
    private InstructorRepository instructorRepository;

    @Transactional
    public InstructorEntity cadastrarInstructor(InstructorEntity instructorEntity) {
        return instructorRepository.save(instructorEntity);
    }
}
