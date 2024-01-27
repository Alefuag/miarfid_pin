import pddlgym
import numpy as np
import random
import sys

from collections import defaultdict
from tqdm import tqdm


def qlearning_experiment(
    total_episodes = 1000, # 1000
    max_steps = 2000,
    learning_rate = 0.2, # Alpha in Q-learning algorithm
    epsilon = 0.99, #0.01
    gamma = 0.995, # Discount factor; default: 0.99
    ):
    
    # INICIALIZACION DE PARAMETROS
    # Crear entorno de PDDLGym a partir de nuestro dominio
    env = pddlgym.make("PDDLEnvAeropuerto-v0")
    # Fijar el problema del entorno
    env.fix_problem_index(0)
    # Iniciar el entorno con el agente para que este en el lugar inicial
    state, debug_info = env.reset()

    init_actions = env.action_space.all_ground_literals(state)
    # print(init_actions)

    all_actions = env.action_space._all_ground_literals
    num_actions = len(all_actions)
    action_index = { v:k for k, v in enumerate(all_actions) }
    reversed_action_index = { v:k for k, v in action_index.items() }
    qtable = defaultdict(lambda: np.zeros(num_actions))

    # ALGORITMO Q-LEARNING
    # Entrenamos hasta un numero maximo de episodios (reinicios)
    for episode in tqdm(range(total_episodes)):
        state, debug = env.reset()
        # El agente ira tomando decisiones hasta un numero maximo de pasos
        for step in range(max_steps):
            if random.uniform(0,1) > epsilon:
                # EXPLOTACION
                valid_actions_idx = [a in env.action_space.all_ground_literals(state) for a in all_actions]
                act_idx = np.argmax( np.where(valid_actions_idx, qtable[state], 0) )
                # print( valid_actions_idx )
                action = reversed_action_index[act_idx]
            else:
                # EXPLORACION
                action = env.action_space.sample(state)
                act_idx = action_index[action]
            # print(action)
            new_state, reward, done, info = env.step(action)

            qtable[state][act_idx] = qtable[state][act_idx] + learning_rate * (reward + gamma * np.max(qtable[new_state]) - qtable[state][act_idx])
            
            state = new_state
            if done:
                break
        epsilon *= gamma

    # print(qtable)

    # APLICACION DE LA Q-TABLE PARA SACAR UN PLAN CON LA POLITICA
    state, debug = env.reset()
    plan = []
    while True:
        # Valor numerico del estado para sacar la fila de la tabla
        index = np.argmax(qtable[state])
        best_action = reversed_action_index[index]; print(best_action)
        plan.append(best_action)
        state, reward, done, info = env.step(best_action)
        # Acabo cuando llego al objetivo
        if done:
            break

    return plan


