package edu.umsl.cs5012.groupproject.repo;

import org.springframework.data.repository.CrudRepository;

import edu.umsl.cs5012.groupproject.entity.User;

public interface UserRepository extends CrudRepository<User, Integer>{

	User findByLoginId(String loginId);

	User findByLoginIdAndPassword(String loginId, String password);
}
