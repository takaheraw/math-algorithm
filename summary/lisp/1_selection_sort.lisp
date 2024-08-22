(defun selection-sort (arr)
  (let ((n (length arr)))
    (dotimes (i (1- n))
      (let ((min-index i))
        (loop for j from (1+ i) below n
              when (< (nth j arr) (nth min-index arr))
              do (setf min-index j))
        (rotatef (nth i arr) (nth min-index arr))))
    arr))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let* ((input (read-numbers))
       (sorted (selection-sort input)))
  (format t "~{~A~^ ~}" sorted))
