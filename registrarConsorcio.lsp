
; ------------------------------------------------------------
; Registrar un consorcio en el vector vConsorcio
; ------------------------------------------------------------

(defun registrarConsorcio ()
  (print "------------------------------------------------------")
  (print "REGISTRO DE CONSORCIO DE ABOGADOS")

 ; Buscar primera posición disponible
    (setq posicionLibre nil)
    (dotimes (i 2)
      (when (null (consorcioAbogados-nit (aref vConsorcio i)))
        (setq posicionLibre i)
        (return)
      )
    )
    (if (null posicionLibre)
        (print "No es posible registrar mas consorcios. Las 2 posiciones estan ocupadas.")
      
        ; Si hay espacio disponible
        (progn
          
	      (loop
			(print "Ingrese el NIT (numero entero): ")
		    (setq nit (read))
				(if (numberp nit)
					(return nit)
					(print "Error el valor debe ser numerico")
				)
		  )
		
		  
          (prin1 "Ingrese el nombre del consorcio: ")
          (setq nombre (read))

          ; Validación modalidad
          (setq modalidad "")
          (loop
            (print "Ingrese modalidad 'PUBLICO' o 'PRIVADO' (COMILLAS DOBLES): ")
            (setq modalidad (read))
            (if (or (equal modalidad "PUBLICO")
                    (equal modalidad "PRIVADO"))
                (return modalidad)
                (print "Modalidad invalida. Intente de nuevo.")
            )
          )

          ;; Crear consorcio
          (setf (aref vConsorcio posicionLibre)
                (make-consorcioAbogados
                  :nit nit
                  :nombre nombre
                  :modalidad modalidad
                  :abogados (make-array 2)
                )
          )

          (print "------------------------------------------------------")
          (format t "~%Consorcio registrado correctamente en la posicion ~a." posicionLibre)
          (print "------------------------------------------------------")
        )
    )
	;(print(aref vConsorcio 0))
	;(print(aref vConsorcio 1))
)
