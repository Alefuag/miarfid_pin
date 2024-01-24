import pddlgym
import numpy as np
import random
import sys
from collections import defaultdict

# INICIALIZACION DE PARAMETROS

# Crear entorno de PDDLGym a partir de nuestro dominio
env = pddlgym.make("PDDLEnvBloques-v0")
# Fijar el problema del entorno
env.fix_problem_index(0)
# Iniciar el entorno con el agente para que este en el lugar inicial
state, debug_info = env.reset()

num_actions = len(env.action_space)
num_states = len(env.observation_space)

qtable = defaultdict(lambda: np.zeros(num_actions))

total_episodes = 1000
learning_rate = 0.2 # Alpha in Q-learning algorithm
max_steps = 2000

gamma = 0.99 # Discount factor
####################################################################
# #
# RELLENAR: PAR´AMETROS DE EXPLORACI´ON #
# #
####################################################################

epsilon = 0.01

sys.exit(0)
# ALGORITMO Q-LEARNING

# Entrenamos hasta un numero maximo de episodios (reinicios)
for episode in range(total_episodes):
    state, debug = env.reset()
    # El agente ir´a tomando decisiones hasta un n´umero m´aximo de pasos
    for step in range(max_steps):
        # EXPLORACION-EXPLOTACION
        
        # Ejemplo
        if random.uniform(0,1) > epsilon:
            # EXPLOTACION
            pass
        else:
            # EXPLORACION SEGUN ALGORITMO
            action = env.action_space.sample(state)
            new_state, reward, done, info = env.step(action)
####################################################################
# #
# RELLENAR: ACTUALIZAR TABLA #
# #
####################################################################
            state = new_state
            if done:
                break

# APLICACION DE LA Q-TABLE PARA SACAR UN PLAN CON LA POL´ITICA

state, debug = env.reset()
while True:
    # Valor numerico del estado para sacar la fila de la tabla
    index = vistos.index(state)
    ####################################################################
    # #
    # RELLENAR: PLANIFICAR #
    # #
    ####################################################################
    accion_a_aplicar = None
    state, reward, done, info = env.step(accion_a_aplicar)
    # Acabo cuando llego al objetivo
    if done:
        break


