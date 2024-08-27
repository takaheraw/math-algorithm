(defun binary-search (arr target)
  (let ((left 0)
        (right (1- (length arr))))
    (loop while (<= left right)
          do (let ((mid (floor (+ left right) 2)))
               (cond ((= (nth mid arr) target) (return mid))
                     ((< (nth mid arr) target) (setf left (1+ mid)))
                     (t (setf right (1- mid)))))
          finally (return nil))))

(defun read-numbers ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(let* ((arr (read-numbers))
       (target (parse-integer (read-line)))
       (result (binary-search arr target)))
  (if result
      (format t "要素 ~A は配列の ~A 番目にあります。~%" target result)
      (format t "要素 ~A は配列内に見つかりませんでした。~%" target)))
