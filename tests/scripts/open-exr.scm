(define (open-exr caminho)
  (gimp-message (string-append "Abrindo " caminho))
  (let* ((img (car (gimp-file-load RUN-NONINTERACTIVE caminho caminho))))
    (if (> img 0)
        (begin
          (gimp-message "Sucesso na Abertura")
          (gimp-image-delete img))
        (gimp-message "Falha na Abertura"))))