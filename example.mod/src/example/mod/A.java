package example.mod;

import other.mod.B;

public class A {
    public static void main(String[] args) throws Exception {
        System.out.println(B.eight());

        System.out.println(
                new String(A.class.getResourceAsStream("/hello").readAllBytes())
        );
    }
}
