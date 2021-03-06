package pl.coderslab.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.app.model.Role;


public interface RoleRepository extends JpaRepository<Role, Integer> {

    Role findByRole(String role);
}

