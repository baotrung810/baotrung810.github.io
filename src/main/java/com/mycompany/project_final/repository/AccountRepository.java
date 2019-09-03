
package com.mycompany.project_final.repository;

import com.mycompany.project_final.entities.AccountEntity;
import java.io.Serializable;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author AnhLe
 */
@Repository
public interface AccountRepository extends
        CrudRepository<AccountEntity, Integer> {

    public AccountEntity
            findByEmailLikeAndPasswordLike(String email, String password);

    @Query("Select acc From AccountEntity acc "
            + "Join fetch acc.accountRoles "
            + "Where acc.email Like ?1 and "
            + "acc.password Like ?2")
    AccountEntity findAccountByEmailAndPassword(
            String email, String password);
    @Query("SELECT u FROM AccountEntity u LEFT JOIN FETCH u.accountRoles WHERE u.email=?1")
	public Optional<AccountEntity> findByEmail(String username);
}
