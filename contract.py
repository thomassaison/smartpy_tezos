@sp.module
def main():
    class Calculator(sp.Contract):
        def __init__(self):
            self.data.result = 0

        @sp.entrypoint
        def multiply(self, x, y):
            self.data.result = x * y
