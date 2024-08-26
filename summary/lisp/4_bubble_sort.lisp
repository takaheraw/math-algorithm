(defun bubble-sort (arr)
  (let ((n (length arr)))
    (dotimes (i n)
      (dotimes (j (- n i 1))
        (when (> (nth j arr) (nth (1+ j) arr))
          (rotatef (nth j arr) (nth (1+ j) arr)))))
    arr))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let* ((input (read-numbers))
       (sorted (bubble-sort input)))
  (format t "~{~A~^ ~}" sorted))
