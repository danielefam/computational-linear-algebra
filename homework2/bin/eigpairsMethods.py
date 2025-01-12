import numpy as np

def householder_mat(x):
    # Reshaping the input as a column vector (if it is 1D-array or row 2D-array)... actually it works even if it is a non-vectot matrix...
    v = x.reshape(x.size, 1)

    sigma = np.sign(v[0, 0]) * np.linalg.norm(v)

    # Computation of u (versor)
    u = v + sigma * np.eye(v.size, 1)
    u = u / np.linalg.norm(u)

    # Computation of the reflection matrix
    Px = np.identity(v.size) - 2 * u @ u.T

    return Px

def householder(X):
    m, n = X.shape
    
    if m != n:
        print('MATRIX IS NOT SQUARE!')
        return None, None, None, None
    
    # Initialization of the matrices
    R = X.copy()
    Q = np.identity(n)

    for j in range(n):
        Px = householder_mat(R[j:, j])
        Pj = np.identity(n)
        Pj[j:, j:] = Px

        # Update of the Matrices
        R = Pj @ R
        Q = Pj @ Q
    
    Qqual = np.linalg.norm(np.identity(n) - Q @ Q.T)
    
    QRqual = np.linalg.norm(Q @ X - R)

    return Q, R, Qqual, QRqual

def back_substitution(R, b):
    n = R.shape[0]
    x = np.zeros(n)
    for i in range(n-1, -1, -1):
        x[i] = (b[i] - np.dot(R[i, i+1:], x[i+1:])) / R[i, i]
    return x

def compute_solution(A, b):
    Q, R, _, _ = householder(A)
    coeff = Q.T @ b
    return back_substitution(R, coeff)

def inverse_power_method(A, v_k, maxIter = 1000, relTol= 1e-6):
    v_k /= np.linalg.norm(v_k)
    k = 0
    miu_k = 10
    for k in range(maxIter):
        v_til_k1 = compute_solution(A, v_k)
        miu_k1 = v_k @ v_til_k1
        v_k1 = v_til_k1 / np.linalg.norm(v_til_k1)
        k += 1
        if np.abs(miu_k1 - miu_k) < relTol * np.abs(miu_k1):
            break

        v_k = v_k1
        miu_k = miu_k1
    return 1/miu_k, v_k
        