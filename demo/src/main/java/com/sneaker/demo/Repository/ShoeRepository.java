package com.sneaker.demo.Repository;

import com.sneaker.demo.model.Shoe;
import com.sneaker.demo.model.Size;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoeRepository extends JpaRepository<Shoe, Long>{
    @Query("select s from Shoe s order by lanzamiento")
    List<Shoe> listaZapatillas(Pageable pageable);

    @Query("select z from Shoe s, SizeShoe ss, Size z where s.id=?1 "
    +"and ss.size = z and ss.shoe = s")
    List<Size> listaSizeShoes(Long id);
}
