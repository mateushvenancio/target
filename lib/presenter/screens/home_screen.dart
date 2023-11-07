import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:target/constants.dart';
import 'package:target/entities/info_entity.dart';
import 'package:target/presenter/components/body.dart';
import 'package:target/presenter/components/main_text_field.dart';
import 'package:target/presenter/stores/infos_store.dart';
import 'package:target/services/show_choice_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final infosStore = GetIt.I<InfoStore>();
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    focusNode.addListener(() {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return Expanded(
                child: _Card(
                  selectedInfo: infosStore.editingInfo,
                  infos: infosStore.infos.toList(),
                  onEdit: (value) {
                    if (infosStore.editingInfo == null) {
                      textController.text = value.content;
                      infosStore.setEditingInfo(value);
                    } else {
                      textController.clear();
                      infosStore.setEditingInfo(null);
                    }
                  },
                  onDelete: (value) {
                    showChoiceDialog(
                      context: context,
                      text: 'Deseja deletar o item "${value.content}"?',
                      onYes: () => infosStore.deleteInfo(value),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return _InfoInput(
                controller: textController,
                onEdit: (value) {
                  textController.clear();
                  infosStore.editInfo(value);
                },
                onCreate: (value) {
                  textController.clear();
                  infosStore.addInfo(value);
                },
                info: infosStore.editingInfo,
                focusNode: focusNode,
              );
            }),
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final List<InfoEntity> infos;
  final InfoEntity? selectedInfo;
  final Function(InfoEntity) onDelete;
  final Function(InfoEntity) onEdit;

  const _Card({
    required this.infos,
    required this.selectedInfo,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      elevation: AppConstants.elevation,
      child: infos.isEmpty
          ? const Center(child: Text('Sem informações ainda'))
          : Container(
              constraints: const BoxConstraints(
                minHeight: 16,
              ),
              child: ListView.separated(
                itemCount: infos.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  return _CardItem(
                    infos[index],
                    selected: selectedInfo?.id == infos[index].id,
                    onEdit: () => onEdit(infos[index]),
                    onDelete: () => onDelete(infos[index]),
                  );
                },
                shrinkWrap: false,
              ),
            ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final InfoEntity item;
  final Function() onEdit;
  final Function() onDelete;
  final bool selected;

  const _CardItem(
    this.item, {
    required this.onEdit,
    required this.onDelete,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        Expanded(child: Text(item.content)),
        IconButton(
          onPressed: onEdit,
          icon: const Icon(Icons.edit),
          color: selected ? AppColors.green : Colors.black,
        ),
        IconButton(onPressed: onDelete, icon: const Icon(Icons.delete_forever)),
      ],
    );
  }
}

class _InfoInput extends StatelessWidget {
  final InfoEntity? info;
  final TextEditingController controller;
  final Function(InfoEntity) onEdit;
  final Function(String) onCreate;
  final FocusNode? focusNode;

  const _InfoInput({
    this.info,
    required this.controller,
    required this.onEdit,
    required this.onCreate,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return MainTextField(
      controller: controller,
      hint: 'Digite seu texto',
      focusNode: focusNode,
      onSubmit: (value) {
        if (info == null) {
          onCreate(value);
        } else {
          final newInfo = InfoEntity(
            id: info!.id,
            content: value,
          );
          onEdit(newInfo);
        }
      },
    );
  }
}
