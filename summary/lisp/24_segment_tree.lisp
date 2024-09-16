(defstruct segment-tree
  tree
  n)

(defun build-segment-tree (data)
  (let* ((n (length data))
         (tree (make-array (* 2 n) :initial-element 0))
         (seg-tree (make-segment-tree :tree tree :n n)))
    (loop for i from 0 below n do
      (setf (aref (segment-tree-tree seg-tree) (+ n i)) (nth i data)))
    (loop for i from (1- n) downto 1 do
      (setf (aref (segment-tree-tree seg-tree) i)
            (+ (aref (segment-tree-tree seg-tree) (* 2 i))
               (aref (segment-tree-tree seg-tree) (1+ (* 2 i))))))
    seg-tree))

(defun update-segment-tree (seg-tree index value)
  (let ((n (segment-tree-n seg-tree)))
    (incf index n)
    (setf (aref (segment-tree-tree seg-tree) index) value)
    (loop while (> index 1) do
      (setf index (floor index 2))
      (setf (aref (segment-tree-tree seg-tree) index)
            (+ (aref (segment-tree-tree seg-tree) (* 2 index))
               (aref (segment-tree-tree seg-tree) (1+ (* 2 index))))))))

(defun query-segment-tree (seg-tree left right)
  (let ((n (segment-tree-n seg-tree))
        (result 0))
    (incf left n)
    (incf right n)
    (loop while (< left right) do
      (when (= (mod left 2) 1)
        (incf result (aref (segment-tree-tree seg-tree) left))
        (incf left))
      (when (= (mod right 2) 1)
        (decf right)
        (incf result (aref (segment-tree-tree seg-tree) right)))
      (setf left (floor left 2))
      (setf right (floor right 2)))
    result))

;; 使用例
(defun main ()
  (let* ((data '(1 3 5 7 9 11))
         (seg-tree (build-segment-tree data)))
    (format t "範囲 [1, 4) の合計: ~A~%" (query-segment-tree seg-tree 1 4))
    (update-segment-tree seg-tree 2 10)
    (format t "更新後の範囲 [1, 4) の合計: ~A~%" (query-segment-tree seg-tree 1 4))))

(main)
