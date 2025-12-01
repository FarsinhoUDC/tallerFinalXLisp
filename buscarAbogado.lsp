; ------------------------------------------------------------
; Buscar un abogado dentro de un consorcio
; Entrada: NIT del consorcio y tarjeta profesional del abogado
; ------------------------------------------------------------

(defun buscarAbogado ()
  (print "------------------------------------------------------")
  (print "BUSCAR ABOGADO EN CONSORCIO")
  (print "------------------------------------------------------")

  ;; Leer NIT
  (setq nitBusqueda nil)
  (loop
    (print "Digite el NIT del consorcio:")
    (setq nitBusqueda (read))
    (if (numberp nitBusqueda)
        (return nitBusqueda)
        (print "El NIT debe ser numerico.")
    )
  )

  ;; Buscar consorcio
  (setq consEncontrado nil)
  (dotimes (i 2)
    (let ((cons (aref vConsorcio i)))
      (when (and cons
                 (consorcioAbogados-nit cons)
                 (= nitBusqueda (consorcioAbogados-nit cons)))
        (setq consEncontrado cons)
        (return)
      )
    )
  )

  (when (null consEncontrado)
    (print "No existe un consorcio con ese NIT.")
    (return-from buscarAbogado nil)
  )

  ;; Leer tarjeta profesional
  (setq tarjetaBus nil)
  (loop
    (print "Digite la tarjeta profesional del abogado:")
    (setq tarjetaBus (read))
    (if (numberp tarjetaBus)
        (return tarjetaBus)
        (print "La tarjeta profesional debe ser numerica.")
    )
  )

  ;; Buscar abogado dentro del consorcio
  (setq abogadoEncontrado nil)
  (let ((abogados (consorcioAbogados-abogados consEncontrado)))
    (dotimes (j (length abogados))
      (let ((abg (aref abogados j)))
        (when (and abg
                   (abogado-tarjeta abg)
                   (= tarjetaBus (abogado-tarjeta abg)))
          (setq abogadoEncontrado abg)
          (return)
        )
      )
    )
  )

  (if abogadoEncontrado
      (progn
        (print "------------------------------------------------------")
        (print "ABOGADO ENCONTRADO")
        (format t "Nombre: ~a~%" (abogado-nombre abogadoEncontrado))
        (format t "Tarjeta Profesional: ~a~%" (abogado-tarjeta abogadoEncontrado))
        (format t "Tipo: ~a~%" (abogado-tipo abogadoEncontrado))
        (print "------------------------------------------------------")
      )
      (print "El abogado NO existe dentro de ese consorcio.")
  )
)
