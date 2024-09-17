(defstruct union-find
  (parent nil)
  (rank nil))

(defun make-union-find (size)
  (let ((uf (make-union-find)))
    (setf (union-find-parent uf) (make-array size :initial-contents (loop for i below size collect i)))
    (setf (union-find-rank uf) (make-array size :initial-element 0))
    uf))

(defun find-set (uf x)
  (let ((parent (aref (union-find-parent uf) x)))
    (if (= parent x)
        x
        (let ((root (find-set uf parent)))
          (setf (aref (union-find-parent uf) x) root)
          root))))

(defun union-sets (uf x y)
  (let ((root-x (find-set uf x))
        (root-y (find-set uf y)))
    (unless (= root-x root-y)
      (let ((rank-x (aref (union-find-rank uf) root-x))
            (rank-y (aref (union-find-rank uf) root-y)))
        (if (< rank-x rank-y)
            (setf (aref (union-find-parent uf) root-x) root-y)
            (progn
              (setf (aref (union-find-parent uf) root-y) root-x)
              (when (= rank-x rank-y)
                (incf (aref (union-find-rank uf) root-x)))))))))

(defun connected-p (uf x y)
  (= (find-set uf x) (find-set uf y)))

;; 使用例
(let ((uf (make-union-find 10)))
  (union-sets uf 1 2)
  (union-sets uf 2 3)
  (format t "1と3は連結していますか？ ~a~%" (connected-p uf 1 3))
  (format t "1と4は連結していますか？ ~a~%" (connected-p uf 1 4)))
