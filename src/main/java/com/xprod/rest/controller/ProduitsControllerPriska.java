/*
 * package com.xprod.rest.controller;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.validation.annotation.Validated; import
 * org.springframework.web.bind.annotation.CrossOrigin; import
 * org.springframework.web.bind.annotation.DeleteMapping; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.PutMapping; import
 * org.springframework.web.bind.annotation.RequestBody; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RestController;
 * 
 * import com.xprod.rest.dao.ProduitsDao; import com.xprod.rest.entity.Produits;
 * 
 * @RestController
 * 
 * @RequestMapping
 * 
 * @CrossOrigin("*") public class ProduitsControllerPriska {
 * 
 * //@Autowired injection de dépendance de ma classe produits dao
 * 
 * @Autowired ProduitsDao produitsDao;
 * 
 * @GetMapping("/produits") //Donne le chemin pour aller chercher le produit
 * public List<Produits>
 * getAllProduits(@Validated @RequestBody(required=false)Produits produits){
 * return produitsDao.getProduits(); // retourne la liste qui se trouve dans
 * produitsDao car produitsDao a acces à la connection
 * 
 * }
 * 
 * @PostMapping("/produits") public Produits
 * createProduit(@Validated @RequestBody(required=false)Produits produits) {
 * return produitsDao.saveProduits(produits); // pour créer un produit
 * 
 * } // pour afficher le produit
 * 
 * @GetMapping("/produits/{IdProduit}") public ResponseEntity
 * findProduitById(@PathVariable(name="IdProduit") Long IdProduit){
 * // @PathVariable... = Chemin de produit qui contient l'ID
 * 
 * if(IdProduit == null) { return ResponseEntity.badRequest().
 * body("Impossible de retrouver le produit d'un ID null"); //Si l'id est null,
 * affiche l'erreur } //Je rentre dans ma base de donnée en passant par
 * produitsDao Produits aproduit = produitsDao.getProduitById(IdProduit); if
 * (aproduit == null) { return ResponseEntity.notFound().build(); //Si le
 * produit n'a pas été trouvé, l'afficher } return
 * ResponseEntity.ok().body(aproduit); //affiche le produit dans body }
 * 
 * //Pour mettre à jour le produit
 * 
 * @PutMapping("/produits") public Produits
 * updateProduit(@Validated @RequestBody(required=false)Produits produits) {
 * return produitsDao.saveProduits(produits); }
 * 
 * //Pour supprimer un produit
 * 
 * @DeleteMapping("/produits/{id}") public ResponseEntity<Produits>
 * deleteProduit(@PathVariable(name="id") Long IdProduit){ Produits dproduit =
 * produitsDao.getProduitById(IdProduit); //insert la produit dans une variable
 * if(dproduit == null) { return ResponseEntity.notFound().build(); }
 * produitsDao.deleteProduit(dproduit); return
 * ResponseEntity.ok().body(dproduit);
 * 
 * } }
 */