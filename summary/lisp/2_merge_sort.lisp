(defun merge-sort (arr)
  (if (<= (length arr) 1)
      arr
      (let* ((mid (floor (length arr) 2))
             (left (subseq arr 0 mid))
             (right (subseq arr mid)))
        (merge-lists (merge-sort left) (merge-sort right)))))

(defun merge-lists (left right)
  (cond ((null left) right)
        ((null right) left)
        (t (if (<= (car left) (car right))
               (cons (car left) (merge-lists (cdr left) right))
               (cons (car right) (merge-lists left (cdr right)))))))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let* ((input (read-numbers))
       (sorted (merge-sort input)))
  (format t "~{~A~^ ~}" sorted))
