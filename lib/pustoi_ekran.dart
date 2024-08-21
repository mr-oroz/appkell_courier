import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PustoiEkran extends HookWidget {
  const PustoiEkran({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(0);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                height: 100,
                width: double.infinity,
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AlignTransition(
                      alignment: AlignmentTween(
                        begin: const Alignment(-10, 0),
                        end: const Alignment(1, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: const AlwaysStoppedAnimation(1),
                          curve: Curves.linearToEaseOut,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (count.value > 0) {
                            count.value--;
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      count.value.toString(),
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () => count.value++,
                      icon: const Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
