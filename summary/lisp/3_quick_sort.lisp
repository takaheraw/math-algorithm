(defun quick-sort (arr)
  (if (<= (length arr) 1)
      arr
      (let* ((pivot (nth (random (length arr)) arr))
             (less (remove-if-not (lambda (x) (< x pivot)) arr))
             (equal (remove-if-not (lambda (x) (= x pivot)) arr))
             (greater (remove-if-not (lambda (x) (> x pivot)) arr)))
        (append (quick-sort less) equal (quick-sort greater)))))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let* ((input (read-numbers))
       (sorted (quick-sort input)))
  (format t "~{~A~^ ~}" sorted))
