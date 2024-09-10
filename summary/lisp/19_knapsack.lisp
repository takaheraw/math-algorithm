(defun knapsack (weights values capacity)
  (let* ((n (length weights))
         (dp (make-array (list (1+ n) (1+ capacity)) :initial-element 0)))
    (loop for i from 1 to n do
      (loop for w from 1 to capacity do
        (if (<= (nth (1- i) weights) w)
            (setf (aref dp i w)
                  (max (aref dp (1- i) w)
                       (+ (nth (1- i) values)
                          (aref dp (1- i) (- w (nth (1- i) weights))))))
            (setf (aref dp i w) (aref dp (1- i) w)))))
    (aref dp n capacity)))

(defun read-integer-list ()
  (mapcar #'parse-integer (split-sequence:split-sequence #\Space (read-line))))

(format t "重さのリストを入力してください (スペース区切り): ")
(defvar weights (read-integer-list))
(format t "価値のリストを入力してください (スペース区切り): ")
(defvar values (read-integer-list))
(format t "ナップサックの容量を入力してください: ")
(defvar capacity (parse-integer (read-line)))

(defvar max-value (knapsack weights values capacity))
(format t "ナップサックに入れられる最大の価値: ~A~%" max-value)
