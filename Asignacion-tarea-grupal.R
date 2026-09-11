nombres <- c("SANCHEZ RAMIREZ ANA KAREN", "CALDERON AGUILAR ANDREA CELIN", 
              "Palacios Díaz Atl Gerardo", "CABELLO MELGAREJO CECILIA", 
              "NOBILE CHIARA", "VERGARA PEREZ CITLALLI", "FERNANDEZ LECHUGA ERICK SEBASTIAN", 
              "OVANDO MENDEZ ESTELA", "GARCIA PEREZ JOSE EMILIO", "LOPEZ CASTILLEJOS KYLIE", 
              "SANCHEZ MARIN LUIS DAVID", "Reyes de Paz  Michel Ailyn", "SANCHEZ LIMON OMAR", 
              "OLVERA ANAYA PAOLA", "RAMIREZ MUÑOZ REGINA", "BAÑUELOS ARIAS URIEL SALVADOR", 
              "BARAJAS CARDONA VALERIA IRENE")

source("../Proyectos/Shuffle.R")

n <- nombres[shuffle(length(nombres))]

Tema <- c("Thirteen Gorillas (Ebola)", "Dinner at the rat farm (SARS)",
          "Celestial hosts (Nipah virus)", "The Chimp and the river (VIH-SIDA)") |> rep(times = c(4, 4, 4, 5))

Asignacion <- data.frame(Nombre = n, Tema = Tema)

write.csv(Asignacion, "../Cosas ENES/Materias/Medicina-Cons/Asignacion-tarea-final.csv")
