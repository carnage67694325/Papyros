import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/home/presentation/view/widgets/carousel_indicitor.dart';
import 'package:papyros/features/home/presentation/view/widgets/tag_item.dart';

class TagCarousel extends StatefulWidget {
  final List<String> tags;
  final String? selectedTag;
  final Function(String) onTagSelected;

  const TagCarousel({
    super.key,
    required this.tags,
    this.selectedTag,
    required this.onTagSelected,
  });

  @override
  State<TagCarousel> createState() => _TagCarouselState();
}

class _TagCarouselState extends State<TagCarousel> {
  late PageController _tagPageController;
  int _currentTagPage = 0;

  @override
  void initState() {
    super.initState();
    _tagPageController = PageController(
      viewportFraction: 0.3,
      initialPage: widget.selectedTag != null
          ? widget.tags.indexOf(widget.selectedTag!)
          : 0,
    );

    _tagPageController.addListener(() {
      int next = _tagPageController.page!.round();
      if (_currentTagPage != next) {
        setState(() {
          _currentTagPage = next;
        });
        widget.onTagSelected(widget.tags[next]);
      }
    });
  }

  @override
  void dispose() {
    _tagPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel
        SizedBox(
          height: 55.h,
          child: Stack(
            children: [
              Positioned.fill(
                left: -150.w,
                right: -10.w,
                child: PageView.builder(
                  controller: _tagPageController,
                  itemCount: widget.tags.length,
                  onPageChanged: (index) {
                    widget.onTagSelected(widget.tags[index]);
                  },
                  itemBuilder: (context, index) {
                    final tag = widget.tags[index];
                    final isSelected = index == _currentTagPage;

                    return TagItem(
                      tag: tag,
                      isSelected: isSelected,
                      onTap: () {
                        widget.onTagSelected(tag);
                        _tagPageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Indicator dots
        SizedBox(height: 14.h),
        CarouselIndicator(
          itemCount: widget.tags.length,
          currentIndex: _currentTagPage,
        ),
      ],
    );
  }
}
