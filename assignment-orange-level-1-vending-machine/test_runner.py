import random
import matplotlib.pyplot as plt

class VendingMachine:
    def __init__(self):
        self.total = 0  # Tracks total coins inserted

    def insert_coin(self, coin):
        if coin not in [5, 10]:
            raise ValueError("Invalid coin")
        
        self.total += coin
        dispense = False
        
        if self.total >= 15:
            dispense = True
            self.total = 0  # Reset after dispensing
            
        return dispense

def simulate(num_trials=20):
    times = []
    coin5 = []
    coin10 = []
    dispense_list = []
    
    time = 0
    for trial in range(num_trials):
        vm = VendingMachine()
        
        while True:
            coin = random.choice([5, 10])
            c5 = 1 if coin == 5 else 0
            c10 = 1 if coin == 10 else 0
            
            d = vm.insert_coin(coin)
            
            times.append(time)
            coin5.append(c5)
            coin10.append(c10)
            dispense_list.append(1 if d else 0)
            
            time += 10000
            
            if d:
                break  # Move to next trial after dispensing

    return times, coin5, coin10, dispense_list

def plot_simulation(times, coin5, coin10, dispense_list):
    plt.figure(figsize=(12,6))
    plt.plot(times, coin5, label='coin5')
    plt.plot(times, coin10, label='coin10')
    plt.plot(times, dispense_list, label='dispense')
    plt.xlabel('Time (ns)')
    plt.ylabel('Signal')
    plt.title('Vending Machine FSM Simulation')
    plt.legend()
    plt.grid(True)
    plt.show()

def print_table(times, coin5, coin10, dispense_list):
    print("time    coin5  coin10  dispense")
    print("------------------------------")
    for t, c5, c10, d in zip(times, coin5, coin10, dispense_list):
        print(f"{t:6}   {c5}      {c10}      {d}")

if __name__ == "__main__":
    times, coin5, coin10, dispense_list = simulate(num_trials=20)
    print_table(times, coin5, coin10, dispense_list)
    plot_simulation(times, coin5, coin10, dispense_list)